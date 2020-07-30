FactoryBot.define do
 factory :random_recipe, class: Recipe do
    title { "chicken and rice" }
    ingredients { "rice, chicken"}
    description { "Put rice in pot and cook chicken"}
    association :user
 end

 factory :user, class: User do
    email {"someone@gmail.com"}
    password {"!password!"}
end

factory :user2, class: User do
   email {"eappenalan@gmail.com"}
   password {"!password!"}
end

end


 
