class EmailsController < ApplicationController
  before_action :set_email, except: [:index, :new, :create]

  def index
    @emails = Email.order({ sent_at: :desc })
  end

  def show
  end

  def new
    @email = Email.new
  end

  def edit
  end

  def create
    email = Email.create!(email_params)
    redirect_to email_path(email)
  end

  def update
    @email.update!(email_params)
    redirect_to email_path(@email)
  end

  def destroy
    @email.destroy
    respond_to(&:js)
  end

  def test_email
    UserMailer.daily_email(email_id: @email.id, user_id: @current_user.id).deliver_later
    flash[:success] = "Test email enqueued"
    redirect_to email_path(@email)
  end

  private

  def set_email
    @email = Email.find(params[:id])
  end

  def email_params
    params.require(:email).permit(:subject, :body, :cta_text, :cta_link, :sent_at, :is_draft)
  end
end
