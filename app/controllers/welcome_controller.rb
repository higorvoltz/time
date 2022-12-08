# frozen_string_literal: true

class WelcomeController < ApplicationController
  http_basic_authenticate_with name: 'higor', password: 'amorim'
  def index; end
end
