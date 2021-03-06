[ { short_name: 'TAP',    name: 'Transportes Aéreos Portugueses, S.A.',    vat_prefix: 'PT', vat_number: '500278725'  },
  { short_name: 'TAP_BR', name: 'TAP - Manutenção e Engenharia Brasil',    vat_prefix: 'BR', vat_number: '04.755.827' },
  { short_name: 'IPAC',   name: 'Instituto Português de Acreditação I.P.', vat_prefix: 'PT', vat_number: '507031059'  }
].each { |c| Company.create c }
[ { name: 'ME',          designation: 'Maintenance & Engineering' },
  { name: 'ME/MA',       designation: 'Aircraft Maintenance' },
  { name: 'ME/MA/LG',    designation: 'Logistics' },
  { name: 'ME/MA/LG/EF', designation: 'Tool Shop' },
  { name: 'ME/MC',       designation: 'Components Maintenance' },
  { name: 'ME/MC/HP',    designation: 'Hydraulics and Pneumatics Shop' },
  { name: 'ME/MC/HP/AP', designation: 'Pneumatics Accessories' },
  { name: 'ME/MC/IE',    designation: 'Avionics Shop' },
  { name: 'ME/QS',       designation: 'Quality and Safety' },
  { name: 'ME/QS/LB',    designation: 'Laboratories' },
  { name: 'ME/QS/LB/CA', designation: 'Calibrations' },
  { name: 'ME/QS/LB/ND', designation: 'Non-Destructive Testing' },
  { name: 'ME/QS/LB/FQ', designation: 'Physical and Chemical Testing' }
].each { |d| Company.first.departments.create d }

[ { email: 'admin@test.com',    password: '00000000', role: 'admin',   department: 'ME'    },
  { email: 'manager1@test.com', password: '00000000', role: 'manager', department: 'ME/QS' },
  { email: 'manager2@test.com', password: '00000000', role: 'manager', department: 'ME/MA' },
  { email: 'auditor@test.com',  password: '00000000', role: 'auditor', department: 'ME'    },
  { email: 'guest@test.com',    password: '00000000', role: 'guest',   department: 'ME'    }
].each { |u| User.create u }

[ { reference: 'MUL001',
    designation: 'Reference Digital Multimeter',
    brand: 'Agilent Technologies',
    model: '3458A',
    serial_number: '2532A92355',
    company: 'TAP',
    department: 'ME/QS/LB/CA' },
  { reference: 'MUL002',
    designation: 'Precision Nanovoltmeter',
    brand: 'Agilent Technologies',
    model: '34420A',
    serial_number: '123B1438',
    company: 'TAP',
    department: 'ME/QS/LB/CA' },
  { reference: 'MUL003',
    designation: 'Digital Handheld Multimeter',
    brand: 'Fluke',
    model: '87-III',
    serial_number: '1703755432',
    company: 'TAP',
    department: 'ME/MA/LG/EF' },
  { reference: 'CAL001',
    designation: 'Reference Pressure Calibrator',
    brand: 'DH Instruments',
    model: 'PPC4',
    serial_number: 'A2553',
    company: 'TAP',
    department: 'ME/QS/LB/CA' },
  { reference: 'MAN001',
    designation: 'Digital Manometer',
    brand: 'Wika Mensor',
    model: 'DPG2300A',
    serial_number: '47322131',
    company: 'TAP',
    department: 'ME/MA/LG/EF' },
  { reference: 'MAN002',
    designation: 'Digital Manometer',
    brand: 'Wika Mensor',
    model: 'DPG2300A',
    serial_number: '47322144',
    company: 'TAP',
    department: 'ME/QS/LB/CA' },
  { reference: 'MUL004',
    designation: '6.5 Digit Benchtop Digital Multimeter',
    brand: 'Agilent Technologies',
    model: '34401A',
    serial_number: 'XS201A12217',
    company: 'TAP',
    department: 'ME/QS/LB/CA' },
  { reference: 'MAN003',
    designation: 'Bourdon Type Class 0.1 Analog Manometer',
    brand: 'Heise',
    model: 'BD16',
    serial_number: '78851',
    company: 'TAP',
    department: 'ME/MC/HP/AP' }
].each { |i| Instrument.create i }
