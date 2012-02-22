class RemoveCompanyFromRecruiters < ActiveRecord::Migration
  def change
    remove_column :recruiters, :company_id
  end
end
