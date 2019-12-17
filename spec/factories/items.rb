require 'faker'
FactoryBot.define do

  factory :item do
    item_name             {"りんご"}
    order_id              {"0"}
    user_id               {"1"}
    explain               {"商品の説明です"}
    status                {"出品中"}
    fee                   {"送料込み"}
    s_prefecture          {"山形県"}
    s_date                {"1~2日で発送"}
    price                 {5000}
    view                  {0}
    size                  {"S"}
    size_type             {0}
    category_id           {1}
    created_at            {"2019-1-1"}
    updated_at            {"2019-1-1"}
  end

end
