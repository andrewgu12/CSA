class AuxiliariesController < ApplicationController

  def new
    @page_title = "auxiliary"
  end

  def create
    @page_title = "auxiliary"
    @auxiliary = Auxiliary.new(auxiliary_params)
    @auxiliary.approved = 0
    @auxiliary.save
    AuxiliaryInsert.insert(@auxiliary, 0)
    AuxiliaryMailer.application(@auxiliary).deliver_now
  end

  def index
    @page_title = "auxiliary"
    @auxiliaries = Auxiliary.where(:approved => 1)
  end

  def destroy    
    Auxiliary.find(params[:id]).destroy
    redirect_to admin_ao_dashboard_path
  end

  def accept
    @auxiliary = Auxiliary.find(params[:id])
    @auxiliary.approved = 1
    AuxiliaryInsert.insert(@auxiliary, 1)
    @auxiliary.save
    redirect_to admin_ao_dashboard_path
  end

  private

  def auxiliary_params
    params.require(:auxiliary).permit(:name, :email, :major, :expected_graduation)
  end

end
