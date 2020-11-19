class EmailsController < ApplicationController
  def create
    @email = Email.new
    @email.object = Faker::Company.bs
    @email.body = Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false)
    @email.read_status = false
    if @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { flash[:notice] = "Email created" }
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def show
    @email = Email.find(params[:id])
  end

  def index
    @emails = Email.all
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def new
    @email = Email.new
  end
end

private

def email_params
  params.permit(:object, :body, :id, :read_status)
end
