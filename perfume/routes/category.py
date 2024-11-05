
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


@app.route('/categories')
def categories():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM perfumior.categories ORDER BY id ASC")
    categories = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('categories.html', categories=categories)


@app.route('/create_category', methods=['GET', 'POST'])
def create_category():
    if request.method == 'POST':
        name = request.form['name']
        photo = request.files['photo']
        if photo:
            filename = secure_filename(photo.filename)
            photo.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        else:
            filename = None
        conn = get_db_connection()
        cursor = conn.cursor()
        insert_query = """
            INSERT INTO perfumior.categories (name, photo)
            VALUES (%s, %s)
        """
        cursor.execute(insert_query, (name, filename))
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'success': True})
    else:
        return 'Method not allowed', 405


@app.route('/update_category/<int:category_id>', methods=['POST'])
def update_category(category_id):
    name = request.form['name']
    photo = request.files.get('photo')
    conn = get_db_connection()
    cursor = conn.cursor()
    if name:
        update_query = "UPDATE perfumior.categories SET name = %s WHERE id = %s"
        cursor.execute(update_query, (name, category_id))
    if photo:
        filename = secure_filename(photo.filename)
        photo.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        update_photo_query = "UPDATE perfumior.categories SET photo = %s WHERE id = %s"
        cursor.execute(update_photo_query, (filename, category_id))

    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({'success': True})


@app.route('/delete_category/<int:category_id>', methods=['DELETE'])
def delete_category(category_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    delete_query = "DELETE FROM perfumior.categories WHERE id = %s"
    cursor.execute(delete_query, (category_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'success': True})
