import peewee as pe

database = pe.MySQLDatabase(
    'orm',
    user='root',
    password='',
)


class BaseModel(pe.Model):

    class Meta:
        database = database


class Category(BaseModel):

    class Meta:
        table_name = 'Categories'
        indexes = (
            (('name','code'),True)
        )

    # name = pe.CharField(30, unique=True)
    name = pe.CharField(30,column_name= 'full_name')
    code = pe.CharField(6,default = None) # not sql, but peewee
    description = pe.CharField(100)


class Product(BaseModel):
    class Meta:
        table_name = 'Products'
    name = pe.CharField(25)
    price = pe.FloatField(pe,constraints=[pe.SQL('DEFAULT 0')])
    category = pe.ForeignKeyField(
        Category,
        related_name='fk_category',
        backref='categories',
        on_delete='cascade',
        on_update='cascade',
    )
    inserted_at = pe.DateTimeField(default=pe.datetime.datetime.now)


if __name__ == '__main__':
    database.drop_tables([Category, Product])
    database.create_tables([Category, Product])
