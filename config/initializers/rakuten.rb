  RakutenWebService.configure do |c|
    # (必須) アプリケーションID
    c.application_id = ENV['RAKUTEN_APPLICATION_ID']

    # (任意) 楽天アフィリエイトID
    c.affiliate_id = ENV['RAKUTEN_AFFILIATION_ID']
  end