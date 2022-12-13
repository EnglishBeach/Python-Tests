import peewee as pe

database_connection = pe.MySQLDatabase('orm_2',
                            user='root',
                            password='',
                            autoconnect=False)


class BaseModel(pe.Model):

    class Meta:
        database = database_connection


class Category(BaseModel):

    name = pe.CharField(30, column_name='full_name',null=False,unique=True)
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
    with database_connection:
        # Category.drop_table(safe=False)
        # Category.create_table()

        database_connection.drop_tables([Category, Product])
        database_connection.create_tables([Category, Product])
