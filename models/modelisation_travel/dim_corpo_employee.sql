select
    users.id as user_id,  -- pk
    users.first_name,
    users.last_name,
    users.email,
    users.phone_number,
    users.organisation_id,
    organisations.organisation_name,
    organisations.pricing_plan,
    organisations.subscribed_at
from {{ source('modelisation_sources', 'users') }} as users
left join
    {{ source('modelisation_sources', 'organisations') }} as organisations
    on users.organisation_id = organisations.id
