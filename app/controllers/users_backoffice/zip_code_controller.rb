module UsersBackoffice
  class ZipCodeController < UsersBackofficeController
    def show
      @address = Address.new(params[:zip_code]).get
    end
  end
end
