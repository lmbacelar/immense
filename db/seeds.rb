Department.create name: 'ME',          designation: 'Maintenance & Engineering'
Department.create name: 'ME/MA',       designation: 'Aircraft Maintenance'
Department.create name: 'ME/MA/LG',    designation: 'Logistics'
Department.create name: 'ME/MA/LG/EF', designation: 'Tool Shop'
Department.create name: 'ME/MC',       designation: 'Components Maintenance'
Department.create name: 'ME/MC/HP',    designation: 'Hydraulics and Pneumatics Shop'
Department.create name: 'ME/MC/IE',    designation: 'Avionics Shop'
Department.create name: 'ME/QS',       designation: 'Quality and Safety'
Department.create name: 'ME/QS/LB',    designation: 'Laboratories'
Department.create name: 'ME/QS/LB/CA', designation: 'Calibrations'
Department.create name: 'ME/QS/LB/ND', designation: 'Non-Destructive Testing'
Department.create name: 'ME/QS/LB/FQ', designation: 'Physical and Chemical Testing'


users = [ { email: 'admin@test.com',    password: '00000000', password_confirmation: '00000000', role: 'admin'   },
          { email: 'manager1@test.com', password: '00000000', password_confirmation: '00000000', role: 'manager' },
          { email: 'manager2@test.com', password: '00000000', password_confirmation: '00000000', role: 'manager' },
          { email: 'auditor@test.com',  password: '00000000', password_confirmation: '00000000', role: 'auditor' },
          { email: 'guest@test.com',    password: '00000000', password_confirmation: '00000000', role: 'guest'   } ]
users.each { |u| User.create u }

instruments1 = [ { reference: 'MUL001', 
                   designation: 'Reference Digital Multimeter', 
                   manufacturer: 'Agilent Technologies', 
                   model: '3458A', 
                   serial_number: '2532A92355' },
                 { reference: 'MUL002', 
                   designation: 'Precision Nanovoltmeter', 
                   manufacturer: 'Agilent Technologies', 
                   model: '34420A', 
                   serial_number: '123B1438' },
                 { reference: 'MUL003', 
                   designation: 'Digital Handheld Multimeter', 
                   manufacturer: 'Fluke', 
                   model: '87-III', 
                   serial_number: '1703755432' },
                 { reference: 'CAL001',
                   designation: 'Reference Pressure Calibrator',
                   manufacturer: 'DH Instruments', 
                   model: 'PPC4', 
                   serial_number: 'A2553' },
                 { reference: 'MAN001',
                   designation: 'Digital Manometer',
                   manufacturer: 'Wika Mensor', 
                   model: 'DPG2300A', 
                   serial_number: '47322131' },
                 { reference: 'MAN002',
                   designation: 'Digital Manometer',
                   manufacturer: 'Wika Mensor', 
                   model: 'DPG2300A', 
                   serial_number: '47322144' } ]

instruments2 = [ { reference: 'MUL004', 
                   designation: '6.5 Digit Benchtop Digital Multimeter', 
                   manufacturer: 'Agilent Technologies', 
                   model: '34401A', 
                   serial_number: 'XS201A12217' },
                 { reference: 'MAN003', 
                   designation: 'Bourdon Type Class 0.1 Analog Manometer', 
                   manufacturer: 'Heise', 
                   model: 'BD16', 
                   serial_number: '78851' } ]

instruments1.each { |i| User.where(role: 'manager').first.instruments.create i }
instruments2.each { |i| User.where(role: 'manager').last.instruments.create i }
