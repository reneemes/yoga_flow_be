# frozen_string_literal: true

class CreatePoses < ActiveRecord::Migration[7.1]
  def change
    create_table :poses do |t|
      t.integer :api_id
      t.string :name
      t.string :sanskrit_name
      t.text :description
      t.string :pose_benefits
      t.string :category
      t.string :difficulity
      t.string :translation_name
      t.string :image_url

      t.timestamps
    end
  end
end
