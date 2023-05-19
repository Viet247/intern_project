class Industry < ApplicationRecord
    # 1 industry have many jobs
    has_many :jobs
end
