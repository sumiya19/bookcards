class Bookcard < ApplicationRecord
  has_one :review
  validates :title, presence: true
    

    def self.search(search) #self.でクラスメソッドとしている
        if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
          Bookcard.where(['title LIKE ?', "%#{search}%"])
        else
          Bookcard.all #全て表示。
        end
      end
end
