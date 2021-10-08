SELECT listings.host_id FROM reservations
JOIN listings
ON reservations.listing_id = listings.id
WHERE reservations.guest_id = 2;