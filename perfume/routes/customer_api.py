import os
from flask import render_template, request, jsonify, url_for
from psycopg2.extras import RealDictCursor
import stripe
from app import app
import psycopg2
from flask_cors import CORS
import bcrypt

app.config['UPLOAD_FOLDER'] = 'static/img'
stripe.api_key = "sk_test_51QCJODKPZ3Y6t8k28aKkGx6pfshGVPoJ02fLnTZQozHIqlw27kSTMjS0FTH3F1Xr0TUU8i00J99ppNJ0yEBXwE8q009CEtkulG"
CORS(app)


def get_db_connection():
    conn = psycopg2.connect(
        database="Lemonade",
        user="postgres",
        password="123",
        host="127.0.0.1",
        port="5432"
    )
    return conn


@app.route('/api_create_customer', methods=['POST'])
def api_create_customer():
    try:
        name = request.form.get('name')
        email = request.form.get('email')
        password = request.form.get('password')
        photo_path = 'Chhoy_Kimchhay_-_Copy.jpg'

        if not name or not email or not password:
            return jsonify({'success': False, 'error': 'Name, email, and password are required.'})

        # Hash the password before storing
        hashed_password = bcrypt.hashpw(password.encode(), bcrypt.gensalt()).decode()

        conn = get_db_connection()
        cursor = conn.cursor()
        insert_query = """
            INSERT INTO perfumior.customers (name, email, password, photo)
            VALUES (%s, %s, %s, %s)
        """
        cursor.execute(insert_query, (name, email, hashed_password, photo_path))
        conn.commit()
        return jsonify({'success': True, 'message': 'Customer created successfully'})
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)})
    finally:
        cursor.close()
        conn.close()


@app.route('/api_login', methods=['POST'])
def api_login():
    try:
        email = request.form.get('email')
        password = request.form.get('password')
        if not email or not password:
            return jsonify({'success': False, 'error': 'Email and password are required.'})

        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT id, password FROM perfumior.customers WHERE email = %s", (email,))
        result = cursor.fetchone()

        if result is None:
            return jsonify({'success': False, 'error': 'Invalid email or password'})

        user_id, hashed_password = result  # Unpack result

        if bcrypt.checkpw(password.encode(), hashed_password.encode()):
            return jsonify(
                {'success': True, 'message': 'Login successful', 'id': user_id})  # Include user ID in the response
        else:
            return jsonify({'success': False, 'error': 'Invalid email or password'})
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)})
    finally:
        cursor.close()
        conn.close()


@app.route('/api/products', methods=['GET'])
def get_products():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM perfumior.products")
    products = cursor.fetchall()
    cursor.close()
    conn.close()
    product_list = [
        {
            'id': p[0],
            'name': p[1],
            'description': p[2],
            'price': p[3],
            'stock_quantity': p[4],
            'photo': url_for('static', filename=f'img/{p[5]}', _external=True),
            'category_id': p[6]
        } for p in products
    ]

    return jsonify(product_list)


@app.route('/api/products/<int:product_id>', methods=['GET'])
def get_product(product_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM perfumior.products WHERE id = %s", (product_id,))
    product = cursor.fetchone()  # Fetch a single product
    cursor.close()
    conn.close()

    if product:
        product_detail = {
            'id': product[0],
            'name': product[1],
            'description': product[2],
            'price': product[3],
            'stock_quantity': product[4],
            'photo': url_for('static', filename=f'img/{product[5]}', _external=True),
            'category_id': product[6]
        }
        return jsonify(product_detail)
    else:
        return jsonify({'error': 'Product not found'}), 404


@app.route('/api/category', methods=['GET'])
def get_products_men():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM perfumior.categories")
    categories = cursor.fetchall()
    cursor.close()
    conn.close()
    category_list = [
        {
            'id': p[0],
            'name': p[1],
            'description': p[2],

        } for p in categories
    ]
    return jsonify(category_list)


@app.route('/api/products/category/<int:category_id>', methods=['GET'])
def get_products_by_category(category_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM perfumior.products WHERE category_id = %s", (category_id,))
    products = cursor.fetchall()
    cursor.close()
    conn.close()
    product_list = [
        {
            'id': p[0],
            'name': p[1],
            'description': p[2],
            'price': p[3],
            'stock_quantity': p[4],
            'photo': url_for('static', filename=f'img/{p[5]}', _external=True),
            'category_id': p[6]
        } for p in products
    ]
    return jsonify(product_list)


@app.route('/api/add_to_cart', methods=['POST'])
def add_to_cart():
    try:
        data = request.get_json()
        cus_id = data['cus_id']
        product_id = data['product_id']
        quantity = int(data['quantity'])  # Ensure quantity is treated as an integer
        price = data['price']
        description = data['description']

        conn = get_db_connection()
        cursor = conn.cursor()

        # Check if product already exists in cart
        cursor.execute(
            """
            SELECT quantity FROM perfumior.carts 
            WHERE cus_id = %s AND product_id = %s
            """,
            (cus_id, product_id)
        )
        existing_product = cursor.fetchone()

        if existing_product:
            # Product exists, so update the quantity by adding the new quantity
            new_quantity = existing_product[0] + quantity
            cursor.execute(
                """
                UPDATE perfumior.carts 
                SET quantity = %s 
                WHERE cus_id = %s AND product_id = %s
                """,
                (new_quantity, cus_id, product_id)
            )
        else:
            # Product does not exist, so insert a new row
            cursor.execute(
                """
                INSERT INTO perfumior.carts (cus_id, product_id, quantity, price, description) 
                VALUES (%s, %s, %s, %s, %s)
                """,
                (cus_id, product_id, quantity, price, description)
            )

        conn.commit()  # Commit transaction
        return jsonify({'success': True, 'message': 'Product added to cart successfully.'})

    except Exception as e:
        return jsonify({'success': False, 'error': str(e)})
    finally:
        cursor.close()
        conn.close()


@app.route('/api/cart-items', methods=['GET'])
def get_cart_items():
    customer_id = request.args.get('customerId')
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory=RealDictCursor)
    query = """
        SELECT carts.id,products.name, products.price, carts.quantity
        FROM perfumior.carts
        INNER JOIN perfumior.products ON perfumior.carts.product_id = perfumior.products.id
        WHERE carts.cus_id = %s;
    """
    cursor.execute(query, (customer_id,))
    cart_items = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(cart_items)


@app.route('/api/cart-item/<int:product_id>', methods=['DELETE'])
def delete_cart_item(product_id):
    customer_id = request.args.get('customerId')  # Assuming you pass customerId as a query parameter
    conn = get_db_connection()
    cursor = conn.cursor()
    delete_query = """
        DELETE FROM perfumior.carts 
        WHERE id = %s AND cus_id = %s;
    """
    cursor.execute(delete_query, (product_id, customer_id))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Item deleted successfully'}), 200


@app.route('/api/cart-item/<int:product_id>', methods=['PATCH'])
def update_cart_item_quantity(product_id):
    data = request.get_json()
    quantity = data.get('quantity')
    price_unit = data.get('price_unit')
    conn = get_db_connection()
    cursor = conn.cursor()
    update_query = """
        UPDATE perfumior.carts 
        SET quantity = %s, price = (%s::NUMERIC * %s::NUMERIC)
        WHERE id = %s;
    """
    cursor.execute(update_query, (quantity, price_unit, quantity, product_id))
    conn.commit()
    cursor.close()
    conn.close()
    print(quantity)
    return jsonify({'message': 'Quantity updated successfully'}), 200


@app.route('/api/place-order', methods=['POST'])
def place_order():
    data = request.json
    customer_id = data.get('customerId')
    if not customer_id:
        return jsonify({"message": "Customer ID is required"}), 400

    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory=RealDictCursor)
    query = """
        SELECT carts.id AS cart_id, products.id AS product_id, products.name, products.price, carts.quantity, products.stock_quantity
        FROM perfumior.carts
        INNER JOIN perfumior.products ON perfumior.carts.product_id = perfumior.products.id
        WHERE carts.cus_id = %s;
    """
    cursor.execute(query, (customer_id,))
    cart_items = cursor.fetchall()
    if not cart_items:
        cursor.close()
        conn.close()
        return jsonify({"message": "Cart is empty"}), 404

    # Calculate total price
    total_price = sum(item['price'] * item['quantity'] for item in cart_items)

    # Create a payment intent with Stripe
    try:
        # Create a Stripe Checkout session
        checkout_session = stripe.checkout.Session.create(
            payment_method_types=['card'],
            line_items=[
                {
                    'price_data': {
                        'currency': 'usd',
                        'product_data': {
                            'name': item['name'],
                        },
                        'unit_amount': int(item['price'] * 100),  # Convert to cents
                    },
                    'quantity': item['quantity'],
                } for item in cart_items
            ],
            mode='payment',
            success_url='http://127.0.0.1:5500/cart.html',
            cancel_url='http://127.0.0.1:5000/cancel',
        )

        # Optionally, store the order details in your database
        insert_order_query = """
            INSERT INTO perfumior.orders (cus_id, order_date, total_price, description)
            VALUES (%s, NOW(), %s, %s) RETURNING id;
        """
        order_description = "Order for customer {}".format(customer_id)
        cursor.execute(insert_order_query, (customer_id, total_price, order_description))
        order_id = cursor.fetchone()['id']

        insert_order_details_query = """
            INSERT INTO perfumior.order_details (order_id, product_id, quantity, price, description)
            VALUES (%s, %s, %s, %s, %s);
        """
        for item in cart_items:
            cursor.execute(insert_order_details_query, (
                order_id,
                item['product_id'],
                item['quantity'],
                item['price'],
                item['name']
            ))

            # Update stock quantity for each product
            new_stock_quantity = item['stock_quantity'] - item['quantity']
            if new_stock_quantity < 0:
                cursor.close()
                conn.close()
                return jsonify({"message": f"Insufficient stock for product {item['name']}"}), 400
            cursor.execute(
                """
                UPDATE perfumior.products
                SET stock_quantity = %s
                WHERE id = %s;
                """,
                (new_stock_quantity, item['product_id'])
            )

        # Delete items from the cart after placing the order
        delete_cart_query = """
            DELETE FROM perfumior.carts WHERE cus_id = %s;
        """
        cursor.execute(delete_cart_query, (customer_id,))
        conn.commit()

        # Close the database connection
        cursor.close()
        conn.close()

        return jsonify({
            "message": "Order placed successfully",
            "order_id": order_id,
            "checkout_session_id": checkout_session.id,  # Return the session ID for client use
            "client_secret": checkout_session.client_secret  # You may not need this for checkout sessions
        }), 201

    except Exception as e:
        cursor.close()
        conn.close()
        return jsonify({"error": str(e)}), 500
