class AuxiliariesController < ApplicationController

  def new
    @page_title = "auxiliary"
  end

  def create
    @auxiliary = Auxiliary.create(auxiliary_params)
    AuxiliaryMailer.application(@auxiliary).deliver_now
  end

  def index
    @page_title = "auxiliary"
    @auxiliaries = Auxiliary.where(:approved => 1)
  end

  private

  def auxiliary_params
    params.require(:auxiliary).permit(:name, :email, :major, :expected_graduation, :approved)
  end

end