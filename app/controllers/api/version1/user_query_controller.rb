# frozen_string_literal: true

module Api
  module Version1
    class UserQueryController < ApplicationController
      def index
        return render body: 'NOUSER' unless valid_params?

        result = FsacarsConnectOrganizer.call(params:)

        render body: result.success? ? 'USEROK' : 'NOUSER'
      end

      private

      def valid_params?
        params[:user_query][:user].present? &&
          params[:user_query][:pass].present? &&
          params[:user_query][:auth].present?

      end
    end
  end
end
