# frozen_string_literal: true

module Api
  module Version1
    class UserQueryController < ApplicationController
      def index
        FindUser.call(params[:user])

        render body: valid_params? ? 'USEROK' : 'NOUSER'
      rescue ActiveRecord::RecordNotFound => e
        Rails.logger.error e.message
        render body: 'NOUSER'
      end

      private

      def params
        params.slice(:user, :pass, :auth, :ver, :lat, :lon, :eqpt)
      end

      def valid_params?
        params[:auth].present? &&
          params[:user].present? &&
          params[:pass].present?
      end
    end
  end
end
