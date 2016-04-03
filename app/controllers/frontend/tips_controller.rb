class Frontend::TipsController < Frontend::ApplicationController
	def index
		@tips = Tip.all
	end
end