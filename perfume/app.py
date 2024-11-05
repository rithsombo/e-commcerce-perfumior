
import os
import secrets
secret_key = secrets.token_hex(16)
from flask import Flask, render_template, request, url_for, session
import psycopg2
from werkzeug.utils import redirect
from psycopg2.extras import DictCursor
app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = 'static/img'
app.secret_key = secret_key

def get_db_connection():
    conn = psycopg2.connect(
        database="Lemonade",
        user="postgres",
        password="123",
        host="127.0.0.1",
        port="5432"
    )
    return conn
@app.route('/dashboard')
def dashboard():
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory=DictCursor)
    cursor.execute("""
            SELECT order_details.id, orders.id as order_id,products.name,order_details.quantity,order_details.price
            FROM perfumior.order_details 
            INNER JOIN perfumior.orders ON perfumior.order_details.order_id = perfumior.orders.id 
            INNER JOIN perfumior.products ON perfumior.order_details.product_id =perfumior.products.id
            ORDER BY orders.id ASC
        """)
    orders_detail = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('dashboard.html',orders_detail=orders_detail)

import routes
@app.route('/orders')
def order():
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory=DictCursor)
    cursor.execute("""
        SELECT orders.id, orders.order_date, orders.total_price, customers.name
        FROM perfumior.orders 
        INNER JOIN perfumior.customers ON perfumior.orders.cus_id = perfumior.customers.id 
        ORDER BY orders.id ASC
    """)
    orders = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('orders.html', orders=orders)

@app.route('/orders_details')
def orders_detail():
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory=DictCursor)
    cursor.execute("""
        SELECT order_details.id, orders.id as order_id,products.name,order_details.quantity,order_details.price
        FROM perfumior.order_details 
        INNER JOIN perfumior.orders ON perfumior.order_details.order_id = perfumior.orders.id 
        INNER JOIN perfumior.products ON perfumior.order_details.product_id =perfumior.products.id
        ORDER BY orders.id ASC
    """)
    orders_detail = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('order_details.html', orders_detail=orders_detail)

@app.route('/carts')
def carts():
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory=DictCursor)
    cursor.execute("""
        SELECT carts.id, customers.name as customer,products.name as product,carts.quantity,carts.price
        FROM perfumior.carts 
        INNER JOIN perfumior.customers ON perfumior.carts.cus_id = perfumior.customers.id 
        INNER JOIN perfumior.products ON perfumior.carts.product_id =perfumior.products.id
        ORDER BY carts.id ASC
    """)
    carts = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('carts.html', carts=carts)


@app.route('/', methods=['GET', 'POST'])
def login_page():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        conn = get_db_connection()
        cursor = conn.cursor(cursor_factory=DictCursor)
        cursor.execute("SELECT * FROM perfumior.users WHERE name = %s AND password = %s", (username, password))
        user = cursor.fetchone()
        cursor.close()
        conn.close()
        if user:
            session['user_id'] = user['id']
            session['username'] = user['name']
            session['photo'] = 'img/' + user['photo']
            return redirect(url_for('dashboard'))
        else:
            return render_template('login.html', error=True)
    return render_template('login.html', error=False)
if __name__ == '__main__':
    app.run(debug=True)
