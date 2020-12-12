# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern
  included do
    rescue_from ArgumentError, with: :argument_error
    rescue_from ActiveRecord::NotNullViolation, with: :null_constraint
    rescue_from ActiveRecord::RecordNotUnique, with: :unique_constraint
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_record
    rescue_from ActionController::BadRequest, with: :bad_requests
    rescue_from ActionController::ParameterMissing, with: :param_missing
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def user_not_authorized(exception)
    Rails.logger.error("#{exception.policy.user.email} is #{exception.message}")
    render_error(type: 'Forbidden Error', message: 'You cannot perform this action', status: 403)
  end

  def null_constraint(exception)
    Rails.logger.error(exception.cause)
    render_error(type: 'Validation Error', message: 'Record attributes cannot be null or empty', status: :unprocessable_entity)
  end

  def unique_constraint(exception)
    Rails.logger.error(exception.cause)
    render_error(type: 'Conflict Error', message: 'Record violates a unique constraint', status: :conflict)
  end

  def argument_error(exception)
    render_error(type: 'Argument Error', message: exception.to_s)
  end

  def record_not_found(exception)
    id = " with id = #{exception.id}" if exception.id.present?
    exception = "#{exception.model}#{id} wasn't found" if exception.model.present?
    render_error(
      type: 'Record not found',
      message: exception.to_s,
      status: :not_found
    )
  end

  def unprocessable_record(exception)
    render_error(
      details: exception.record.errors.messages.to_h,
      type: 'Unprocessable entity',
      message: 'Validation failed',
      status: 422
    )
  end

  def param_missing(exception)
    render_error(type: 'Parameter Missing', message: exception.to_s)
  end

  def bad_requests(exception)
    render_error(type: 'Bad request', message: exception.to_s)
  end

  def render_error(type:, message:, status: :bad_request, details: {})
    render json: {
      error: {
        type: type,
        message: message,
        details: details
      }
    }, status: status
  end
end
