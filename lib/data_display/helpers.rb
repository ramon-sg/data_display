module DataDisplay
  module Helpers
    include DataDisplay::Actions

    alias_method :data_display, :__data_display__
    alias_method :dd, :__data_display__
    public :data_display, :dd

    LARGE_ACTIONS = [:edit, :new, :show, :delete, :update, :create]
    SHORT_ACTIONS = [:index]
    ACTIONS = LARGE_ACTIONS + SHORT_ACTIONS

    def display_short?
      ACTIONS.include?(current_action) and SHORT_ACTIONS.include?(current_action) or params_id?
    end

    def params_id?
      params[:id].present?
    end

    def current_action
      params[:action]
    end
  end
end