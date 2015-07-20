class AuxiliariesController < ApplicationController

  def new
  end

  def create
    binding.remote_pry
    @auxiliary = Auxiliary.new(auxiliary_params)
    AuxiliaryMailer.application(@auxiliary).deliver
  end

  def index
    @auxiliaries = Auxiliary.all? { |e|  }
  end

  private

  def auxiliary_params
    params.require(:auxiliary).permit(:name, :email, :major, :expected_graduation)
  end

end