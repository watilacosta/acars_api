# frozen_string_literal: true

module Api
  module Version1
    class UserQueryController < ApplicationController
      def index
        FindUser.call(params:)

        render body: valid_params? ? 'USEROK' : 'NOUSER'
      rescue ActiveRecord::RecordNotFound => e
        puts e
        render body: 'NOUSER'
      end

      private

      def valid_params?
        params[:auth].present? &&
          params[:user].present? &&
          params[:pass].present?
      end
    end
  end
end
