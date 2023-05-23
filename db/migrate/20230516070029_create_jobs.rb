class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.text :benefit
      t.text :company_address
      t.string :company_district
      t.string :company_id
      t.string :company_name
      t.string :company_province
      t.text :description
      t.string :level
      t.string :name
      t.text :requirements
      t.string :salary
      t.string :type_work
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.timestamps
    end
  end
end
