class Api::SurveysController < Api::ApplicationController

  def index
    @collection = current_user.surveys.paginate(paginate_params)
    respond_with @collection
  end

  def create
    @survey = NewSurveyType.new
    @survey.interviewer = current_user
    @survey.assign_attributes(params[:survey])
    @survey.save
    respond_with @survey, serializer: SurveySerializer
  end

  def show
    @survey = current_user.surveys.find(params[:id])
    respond_with @survey, serializer: SurveySerializer
  end

  def update
    @survey = current_user.surveys.find(params[:id]).becomes(NewSurveyType)
    @survey.subscribe(MailNotificationsListener.new)
    @survey.assign_attributes(params[:survey])
    @survey.save
    respond_with @survey, serializer: SurveySerializer
  end

  def destroy
    @survey = current_user.surveys.find(params[:id])
    @survey.delete
    respond_with @survey, serializer: SurveySerializer
  end
end
