from models import Category,Product,database


with database:
    q = Category.update(name = 'unknown').where(id>16).