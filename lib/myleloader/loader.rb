
module Myleloader

  def load
    options = {}
    ctx = Purolie::Context.new options
    profile = Purolie.parse ctx
    upload_profile format profile
  end

  def upload_profile
    # Load MongoDB param

    # Connect to mongodb

    # Insert or update
    
    # Close connection
  end

end
