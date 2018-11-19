# Everyday (cron) => to schedule background jobs at a given frequence
Sidekiq::Cron::Job.create(name: 'Load outputs - every day', cron: '10 15 * * *', class: 'OutputJob') # execute at every 5 minutes, ex: 12:05, 12:10, 12:15...etc
