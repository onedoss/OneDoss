class EmploymentsController < ApplicationController
  
    def destroy
    @employment = Employment.find(params[:id])
    company=@employment.company
    @employment.destroy

    flash[:notice] = "Removed association."
    redirect_to company
    end
    
    def approve
      @employment = Employment.find(params[:id])
      if @employment.approvedByBoth
        flash[:notice] = "Association approved."
        redirect_to @employment.company
      else
        flash[:notice] = "Association approval failed to go through."
        redirect_to @employment.company
      end
    end

end
