class AuxiliariesController < ApplicationController

  def new
  end

  def create
    @auxiliary = Auxiliary.new(auxiliary_params)
    AuxiliaryMailer.application(@auxiliary).deliver_now
  end

  def index
    @auxiliaries = Auxiliary.all? { |e|  }
  end

  private

  def auxiliary_params
    params.require(:auxiliary).permit(:name, :email, :major, :expected_graduation)
  end

end