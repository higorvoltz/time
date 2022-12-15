# frozen_string_literal: true

class ProflesBackofficeController < ApplicationController
  before_action :authenticate_profile!
  layout 'profiles_backoffice'
end
