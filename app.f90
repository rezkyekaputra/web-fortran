program web_fortran
    implicit none
    real(8) :: pi, g, t, v, y, energi_kinetik, massa
    real(8) :: sin_val, cos_val, orbit_x, orbit_y
    character(len=8)  :: tgl
    character(len=10) :: jam
    character(len=10) :: zona

    ! --- 1. PERHITUNGAN SAINS & FISIKA FORTRAN ---
    pi = 3.14159265358979323846d0
    g  = 9.80665d0     ! Percepatan gravitasi bumi (m/s^2)
    massa = 75.0d0     ! Massa objek (kg)
    t  = 4.5d0         ! Waktu jatuh (detik)

    ! Rumus Kinematika Gerak Jatuh Bebas
    v = g * t                        ! Kecepatan akhir: v = g * t
    y = 0.5d0 * g * (t**2)           ! Jarak jatuh: y = 1/2 * g * t^2
    energi_kinetik = 0.5d0 * massa * (v**2) ! Ek = 1/2 * m * v^2

    ! Rumus Orbit Trigonometri
    sin_val = sin(pi / 3.0d0)
    cos_val = cos(pi / 3.0d0)
    orbit_x = 100.0d0 * cos_val
    orbit_y = 100.0d0 * sin_val

    ! Ambil waktu sistem real-time
    call date_and_time(tgl, jam, zona)

    ! --- 2. HTTP HEADER WAJIB ---
    print '(A)', 'HTTP/1.1 200 OK'
    print '(A)', 'Content-Type: text/html; charset=utf-8'
    print '(A)', 'Connection: close'
    print '(A)', ''

    ! --- 3. TAMPILAN HTML MODERN & CYBERPUNK ---
    print '(A)', '<!DOCTYPE html>'
    print '(A)', '<html lang="id"><head><meta charset="utf-8">'
    print '(A)', '<meta name="viewport" content="width=device-width, initial-scale=1.0">'
    print '(A)', '<title>Fortran Cloud Engine - Onii-chan & Imouto</title>'
    print '(A)', '<style>'
    print '(A)', '  * { box-sizing: border-box; margin: 0; padding: 0; }'
    print '(A)', '  body { font-family: "Segoe UI", system-ui, -apple-system, sans-serif; background: #0b0f19; color: #f1f5f9; display: flex; justify-content: center; align-items: center; min-height: 100vh; padding: 20px; }'
    print '(A)', '  .container { background: #131b2e; border: 1px solid #1e293b; border-radius: 24px; padding: 40px; max-width: 600px; width: 100%; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.7); text-align: center; }'
    print '(A)', '  .pill { display: inline-block; background: rgba(56, 189, 248, 0.1); border: 1px solid #38bdf8; color: #38bdf8; padding: 6px 16px; border-radius: 999px; font-size: 13px; font-weight: 600; margin-bottom: 20px; }'
    print '(A)', '  h1 { font-size: 28px; font-weight: 800; background: linear-gradient(135deg, #38bdf8, #818cf8); -webkit-background-clip: text; -webkit-text-fill-color: transparent; margin-bottom: 12px; }'
    print '(A)', '  .desc { font-size: 14px; color: #94a3b8; line-height: 1.6; margin-bottom: 25px; }'
    print '(A)', '  .grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-bottom: 25px; text-align: left; }'
    print '(A)', '  .card { background: #0f172a; border: 1px solid #1e293b; border-radius: 16px; padding: 18px; }'
    print '(A)', '  .card-title { font-size: 12px; font-weight: 700; color: #64748b; text-transform: uppercase; margin-bottom: 8px; }'
    print '(A)', '  .card-val { font-size: 20px; font-weight: 800; color: #38bdf8; font-family: monospace; }'
    print '(A)', '  .card-unit { font-size: 12px; color: #94a3b8; margin-left: 4px; font-weight: 400; }'
    print '(A)', '  .footer { border-top: 1px solid #1e293b; padding-top: 20px; font-size: 12px; color: #64748b; display: flex; justify-content: space-between; }'
    print '(A)', '</style></head><body>'
    print '(A)', '  <div class="container">'
    print '(A)', '    <div class="pill">⚡ FORTRAN 2008 HIGH PERFORMANCE ⚡</div>'
    print '(A)', '    <h1>🌸 Fortran Cloud Engine 🌸</h1>'
    print '(A)', '    <p class="desc">Aplikasi web ini ditenagai langsung oleh algoritma matematika & simulasi fisika murni yang dikompilasi menggunakan <b>GNU Fortran (gfortran)</b> di dalam Google Cloud!</p>'
    print '(A)', '    <div class="grid">'
    print '(A)', '      <div class="card">'
    print '(A)', '        <div class="card-title">Simulasi Gravitasi (t=4.5s)</div>'
    print '(A, F8.2, A)', '        <div class="card-val">', v, '<span class="card-unit">m/s</span></div>'
    print '(A)', '      </div>'
    print '(A)', '      <div class="card">'
    print '(A)', '        <div class="card-title">Jarak Tempuh Jatuh Bebas</div>'
    print '(A, F8.2, A)', '        <div class="card-val">', y, '<span class="card-unit">meter</span></div>'
    print '(A)', '      </div>'
    print '(A)', '      <div class="card">'
    print '(A)', '        <div class="card-title">Energi Kinetik (m=75kg)</div>'
    print '(A, F10.2, A)', '        <div class="card-val">', energi_kinetik, '<span class="card-unit">Joule</span></div>'
    print '(A)', '      </div>'
    print '(A)', '      <div class="card">'
    print '(A)', '        <div class="card-title">Vektor Orbit Cos(&pi;/3)</div>'
    print '(A, F8.4, A)', '        <div class="card-val">', cos_val, '<span class="card-unit">rad</span></div>'
    print '(A)', '      </div>'
    print '(A)', '    </div>'
    print '(A)', '    <div class="footer">'
    print '(A, A, A, A, A)', '      <span>📅 ', tgl(7:8), '/', tgl(5:6), '/', tgl(1:4), '</span>'
    print '(A, A, A, A, A)', '      <span>⏰ ', jam(1:2), ':', jam(3:4), ':', jam(5:6), ' UTC</span>'
    print '(A)', '      <span>Dibuat dengan ❤️ oleh Onii-chan & Imouto</span>'
    print '(A)', '    </div>'
    print '(A)', '  </div>'
    print '(A)', '</body></html>'

end program web_fortran
