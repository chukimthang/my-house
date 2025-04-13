# README

### Lệnh dùng cho railway
* Truy cập container shell của service trên Railway
  ```
  railway shell
  ```
* Check giá trị biến `DATABASE_URL` trên railway sell
  ```
  echo $DATABASE_URL
  ```
* Rails c môi trường production (tạo biến môi trường trên railway `RAILS_MASTER_KEY` với nội dung trong file config/master.key dưới local)
  ```
  RAILS_ENV=production rails c 
  ```
* Muốn kết nối database railway ở dưới local, setup trong database.yml như sau
  ```
  production:
    <<: *default
    url: <%= ENV['DATABASE_PUBLIC_URL'] %>
  ```
