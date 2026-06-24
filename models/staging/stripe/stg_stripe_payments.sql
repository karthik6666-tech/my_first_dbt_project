with source as (

    select *
    from {{ source('stripe', 'payment') }}

),

renamed as (

    select
        id as customer_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status as order_status,
        amount,
        created,
        _batched_at

    from source

)

select *
from renamed