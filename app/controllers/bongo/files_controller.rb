require_dependency "bongo/application_controller"

require "aws-sdk-s3"

module Bongo
  class FilesController < ApplicationController
    before_action :authenticate_user!

    skip_before_action :verify_authenticity_token

    def create
      extension = File.extname(params[:file].original_filename)
      s3 = Aws::S3::Resource.new
      obj = s3.bucket(ENV["AWS_S3_BUCKET"]).object(SecureRandom.uuid + extension)
      obj.upload_file(params[:file])

      respond_to do |format|
        format.json { render json: obj.public_url }
      end
    end
  end
end
