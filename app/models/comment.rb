class Comment < ApplicationRecord
  belongs_to :blog               #blogsテーブルとのアソシエーション
  belongs_to :user                #usersテーブルとのアソシエーション
end
