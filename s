                                          Table "public.tests"
   Column    |              Type              | Collation | Nullable |              Default              
-------------+--------------------------------+-----------+----------+-----------------------------------
 id          | bigint                         |           | not null | nextval('tests_id_seq'::regclass)
 title       | character varying              |           | not null | 
 level       | integer                        |           | not null | 0
 category_id | integer                        |           | not null | 
 author_id   | integer                        |           | not null | 
 created_at  | timestamp(6) without time zone |           | not null | 
 updated_at  | timestamp(6) without time zone |           | not null | 
Indexes:
    "tests_pkey" PRIMARY KEY, btree (id)
    "index_tests_on_author_id" btree (author_id)
    "index_tests_on_category_id" btree (category_id)
    "index_tests_on_level" btree (level)
Foreign-key constraints:
    "fk_rails_cda342dc0a" FOREIGN KEY (category_id) REFERENCES categories(id)
    "fk_rails_d58c5057b2" FOREIGN KEY (author_id) REFERENCES users(id)
Referenced by:
    TABLE "tests_users" CONSTRAINT "fk_rails_318b772344" FOREIGN KEY (test_id) REFERENCES tests(id)
    TABLE "questions" CONSTRAINT "fk_rails_cb4b358d50" FOREIGN KEY (test_id) REFERENCES tests(id)

