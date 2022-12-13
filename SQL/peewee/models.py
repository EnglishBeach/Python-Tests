import peewee as pe

database = pe.MySQLDatabase('orm_2',
                            user='root',
                            password='',
                            autoconnect=False)


class BaseModel(pe.Model):

    class Meta:
        database = database


class Category(BaseModel):

    class Meta:
        # table_name = 'Categories'
        indexes = ((('name', 'code'), True), )

    # name = pe.CharField(30, unique=True)
    name = pe.CharField(30, column_name='full_name')
    code = pe.CharField(6)
    description = pe.CharField(100)


class Product(BaseModel):

    # class Meta:
    #     table_name = 'Products'

    name = pe.CharField(25)
    price = pe.FloatField(constraints=[pe.SQL('DEFAULT 0')])
    category = pe.ForeignKeyField(
        Category,
        related_name='fk_category',
        backref='products',
        on_delete='cascade',
        on_update='cascade',
    )
    inserted_at = pe.DateTimeField(default=pe.datetime.datetime.now)


if __name__ == '__main__':
    with database:
        # Category.drop_table(safe=False)
        # Category.create_table()

        database.drop_tables([Category, Product])
        database.create_tables([Category, Product])
