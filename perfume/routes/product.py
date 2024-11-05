
import os
from flask import render_template, request, jsonify
from psycopg2.extras import DictCursor

from app import app
import psycopg2
from werkzeug.utils import secure_filename
app.config['UPLOAD_FOLDER'] = 'static/img'

def get_db_connection():
    conn = psycopg2.connect(
        database="Lemonade",
        user="postgres",
        password="123",
        host="127.0.0.1",
        port="5432"
    )
    return conn


@app.route('/products')
def product():
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory=DictCursor)

    # Fetch products
    cursor.execute("""
        SELECT products.id, products.name, products.description, products.price, 
               products.stock_quantity, products.photo, categories.name AS cat_name 
        FROM perfumior.products 
        INNER JOIN perfumior.categories ON perfumior.products.category_id = perfumior.categories.id 
        ORDER BY products.id ASC
    """)
    products = cursor.fetchall()

    # Fetch categories
    cursor.execute("SELECT id, name FROM perfumior.categories ORDER BY id ASC")
    categories = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template('products.html', products=products, categories=categories)


@app.route('/create_product', methods=['GET', 'POST'])
def create_product():
    if request.method == 'POST':
        name = request.form['name']
        price = request.form['price']
        description = request.form['description']
        quantity = request.form['quantity']
        category_id = request.form['cat_name']
        photo = request.files['photo']
        if photo:
            filename = secure_filename(photo.filename)
            photo.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        else:
            filename = None
        conn = get_db_connection()
        cursor = conn.cursor()
        insert_query = """
            INSERT INTO perfumior.products (name, description, price, stock_quantity, photo,category_id)
            VALUES (%s, %s, %s, %s, %s,%s)
        """
        cursor.execute(insert_query, (name,description, price, quantity, filename, category_id))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'success': True})
    else:
        return 'Method not allowed', 405

@app.route('/update_product/<int:product_id>', methods=['POST'])
def update_product(product_id):
    name = request.form['name']
    price = request.form['price']
    quantity = request.form['quantity']
    category_id = request.form['cat_name']
    photo = request.files.get('photo')
    conn = get_db_connection()
    cursor = conn.cursor()
    if name:
        update_query = "UPDATE perfumior.products SET name = %s, price = %s, stock_quantity = %s, category_id = %s WHERE id = %s"
        cursor.execute(update_query, (name,price,quantity,category_id, product_id))
    if photo:
        filename = secure_filename(photo.filename)
        photo.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        update_photo_query = "UPDATE perfumior.products SET photo = %s WHERE id = %s"
        cursor.execute(update_photo_query, (filename, product_id))
    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({'success': True})

@app.route('/delete_product/<int:product_id>', methods=['DELETE'])
def delete_product(product_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    delete_query = "DELETE FROM perfumior.products WHERE id = %s"
    cursor.execute(delete_query, (product_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'success': True})
