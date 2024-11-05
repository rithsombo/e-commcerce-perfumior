
import os
from flask import render_template, request, jsonify
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


@app.route('/customers')
def customer():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM perfumior.customers ORDER BY id ASC")
    customers = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('customer.html', customers=customers)


@app.route('/create_customer', methods=['GET', 'POST'])
def create_customer():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        password = request.form['password']
        photo = request.files['photo']
        if photo:
            filename = secure_filename(photo.filename)
            photo.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        else:
            filename = None
        conn = get_db_connection()
        cursor = conn.cursor()
        insert_query = """
            INSERT INTO perfumior.customers (name, email, password, photo)
            VALUES (%s, %s, %s, %s)
        """
        cursor.execute(insert_query, (name, email, password, filename))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'success': True})
    else:
        return 'Method not allowed', 405


@app.route('/update_customer/<int:customer_id>', methods=['POST'])
def update_customer(customer_id):
    name = request.form['name']
    email = request.form['email']
    password = request.form.get('password')
    photo = request.files.get('photo')
    conn = get_db_connection()
    cursor = conn.cursor()
    if password:
        update_query = "UPDATE perfumior.customers SET name = %s, email = %s, password = %s WHERE id = %s"
        cursor.execute(update_query, (name, email, password, customer_id))
    else:
        update_query = "UPDATE perfumior.customers SET name = %s, email = %s WHERE id = %s"
        cursor.execute(update_query, (name, email, customer_id))
    if photo:
        filename = secure_filename(photo.filename)
        photo.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        update_photo_query = "UPDATE perfumior.customers SET photo = %s WHERE id = %s"
        cursor.execute(update_photo_query, (filename, customer_id))

    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({'success': True})


@app.route('/delete_customer/<int:customer_id>', methods=['DELETE'])
def delete_customer(customer_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    delete_query = "DELETE FROM perfumior.customers WHERE id = %s"
    cursor.execute(delete_query, (customer_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'success': True})