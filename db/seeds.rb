# Seed a default admin user
Oath.config.sign_up_service.new(email: "admin@example.com", password: "pa$$w0rd!").perform
