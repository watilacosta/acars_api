# frozen_string_literal: true

module Api
  module Version1
    class UserQueryController < ApplicationController
      def index
        return render body: 'NOUSR' unless valid_params?

        render body: 'USEROK'
      end

      private

      def user_query_params
        params.slice(:user, :pass, :auth, :ver, :lat, :lon, :eqpt)
      end

      def valid_params?
        user_query_params[:auth].present? &&
          user_query_params[:user].present? &&
          user_query_params[:pass].present?
      end
    end
  end
end
