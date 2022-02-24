class Comment < ApplicationRecord

    belongs_to :user #１対多の関係　（多）

    belongs_to :post #１対多の関係(多)

end
