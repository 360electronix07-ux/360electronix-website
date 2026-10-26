<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="theme-color" content="#050816">
  <title>Workspace Login | 360Electronix</title>
  <meta name="description" content="Secure 360Electronix team and client workspace login.">
  <link rel="icon" href="images/hero.png">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
  <link rel="stylesheet" href="css/style.css">
  <style>
    /* Login page additions; uses the existing 360Electronix theme variables. */
    body.login-page {
      min-height: 100vh;
      background: var(--dark, #050816);
      color: var(--white, #fff);
      overflow-x: hidden;
    }
    .login-header {
      position: relative;
      width: 100%;
      z-index: 5;
      background: rgba(5,8,22,.88);
      border-bottom: 1px solid rgba(255,255,255,.08);
      backdrop-filter: blur(20px);
    }
    .login-nav {
      max-width: 1400px;
      min-height: 88px;
      margin: auto;
      padding: 12px 6%;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 20px;

    }
    .login-brand img {
      width: auto;
      height: 58px;
      display: block;
      object-fit: contain;
    }
    .login-back {
      color: #fff;
      text-decoration: none;
      font-size: 14px;
      font-weight: 600;
      transition: color .25s;
    }
    .login-back:hover { color: var(--secondary, #00D9FF); }
    .login-main {
      position: relative;
      min-height: calc(100vh - 150px);
      padding: 55px 20px 70px;
      display: grid;
      place-items: center;
      isolation: isolate;
    }
    .login-main::before {
      content: "";
      position: absolute;
      inset: 0;
      z-index: -2;
      background-image:
        linear-gradient(rgba(255,255,255,.035) 1px, transparent 1px),
        linear-gradient(90deg, rgba(255,255,255,.035) 1px, transparent 1px);
      background-size: 48px 48px;
      mask-image: linear-gradient(to bottom, transparent, #000 20%, #000 80%, transparent);
    }
    .login-main::after {
      content: "";
      position: absolute;
      width: 520px;
      height: 520px;
      top: 8%;
      left: 50%;
      transform: translateX(-50%);
      z-index: -1;
      pointer-events: none;
      background: radial-gradient(circle, rgba(0,87,255,.18), rgba(0,217,255,.06) 42%, transparent 70%);
    }
    .login-layout {
      width: min(100%, 1040px);
      display: grid;
      grid-template-columns: 1fr minmax(320px, 430px);
      gap: clamp(32px, 6vw, 76px);
      align-items: center;
    }
    .login-intro .eyebrow {
      display: inline-flex;
      align-items: center;
      gap: 10px;
      color: var(--secondary, #00D9FF);
      background: rgba(0,217,255,.09);
      border: 1px solid rgba(0,217,255,.28);
      border-radius: 30px;
      padding: 10px 15px;
      font-size: 12px;
      font-weight: 700;
      letter-spacing: 1px;
      text-transform: uppercase;
    }
    .login-intro h1 {
      margin: 24px 0 18px;
      font-size: clamp(36px, 5vw, 60px);
      line-height: 1.08;
      letter-spacing: -1.8px;
      text-shadow: 0 0 25px rgba(0,217,255,.15);
    }
    .login-intro h1 span {
      display: block;
      color: var(--secondary, #00D9FF);
    }
    .login-intro > p {
      max-width: 490px;
      color: var(--gray, #B8C0D9);
      font-size: 16px;
      line-height: 1.85;
    }
    .login-benefits {
      display: grid;
      gap: 16px;
      margin-top: 32px;
    }
    .login-benefit {
      display: flex;
      align-items: center;
      gap: 13px;
      color: #dfe8ff;
      font-size: 14px;
    }
    .login-benefit i {
      width: 38px;
      height: 38px;
      display: grid;
      place-items: center;
      flex: 0 0 38px;
      color: var(--secondary, #00D9FF);
      background: rgba(0,217,255,.09);
      border: 1px solid rgba(0,217,255,.17);
      border-radius: 11px;
    }
    .login-card {
      position: relative;
      padding: clamp(24px, 4vw, 36px);
      border-radius: 22px;
      background: linear-gradient(145deg, rgba(17,28,52,.97), rgba(8,17,31,.98));
      border: 1px solid rgba(0,217,255,.23);
      box-shadow: 0 25px 80px rgba(0,0,0,.35), 0 0 35px rgba(0,87,255,.08);
    }
    .login-card::before {
      content: "";
      position: absolute;
      top: -1px;
      left: 14%;
      right: 14%;
      height: 2px;
      background: linear-gradient(90deg, transparent, #0057FF, #00D9FF, transparent);
    }
    .login-card h2 { font-size: 25px; margin-bottom: 8px; }
    .login-card .card-subtitle {
      color: var(--gray, #B8C0D9);
      font-size: 13px;
      line-height: 1.7;
      margin-bottom: 25px;
    }
    .login-label {
      display: block;
      margin: 0 0 9px;
      color: #eef4ff;
      font-size: 12px;
      font-weight: 700;
    }
    .login-roles {
      display: grid;
      grid-template-columns: repeat(3, minmax(0, 1fr));
      gap: 8px;
      margin-bottom: 23px;
    }
    .login-role { position: relative; }
    .login-role input {
      position: absolute;
      opacity: 0;
      width: 1px;
      height: 1px;
    }
    .login-role span {
      min-height: 43px;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 7px;
      padding: 8px 4px;
      border-radius: 9px;
      border: 1px solid rgba(255,255,255,.12);
      color: #c3cce0;
      background: rgba(5,8,22,.45);
      font-size: 12px;
      font-weight: 600;
      cursor: pointer;
      transition: .2s;
    }
    .login-role input:checked + span {
      color: #fff;
      border-color: var(--secondary, #00D9FF);
      background: linear-gradient(120deg, rgba(0,87,255,.28), rgba(0,217,255,.12));
      box-shadow: inset 0 0 0 1px rgba(0,217,255,.08);
    }
    .login-role input:focus-visible + span {
      outline: 2px solid var(--secondary, #00D9FF);
      outline-offset: 3px;
    }
    .login-field { margin-bottom: 18px; }
    .login-field input {
      display: block;
      width: 100%;
      min-width: 0;
      padding: 14px 14px;
      color: #fff;
      background: rgba(5,8,22,.68);
      border: 1px solid rgba(255,255,255,.13);
      border-radius: 9px;
      font: inherit;
      font-size: 13px;
      outline: none;
      transition: border-color .2s, box-shadow .2s;
    }
    .login-field input::placeholder { color: #7e8ba8; }
    .login-field input:focus {
      border-color: var(--secondary, #00D9FF);
      box-shadow: 0 0 0 3px rgba(0,217,255,.09);
    }
    .login-password {
      display: flex;
      align-items: stretch;
      border: 1px solid rgba(255,255,255,.13);
      border-radius: 9px;
      background: rgba(5,8,22,.68);
    }
    .login-password:focus-within {
      border-color: var(--secondary, #00D9FF);
      box-shadow: 0 0 0 3px rgba(0,217,255,.09);
    }
    .login-password input { border: 0; background: transparent; box-shadow: none !important; }
    .login-password button {
      padding: 0 13px;
      border: 0;
      background: transparent;
      color: var(--secondary, #00D9FF);
      font: inherit;
      font-size: 12px;
      font-weight: 700;
      cursor: pointer;
    }
    .login-forgot-row {
      display: flex;
      justify-content: flex-end;
      margin-top: -7px;
      margin-bottom: 21px;
    }
    .login-forgot {
      color: var(--secondary, #00D9FF);
      font-size: 12px;
      text-decoration: none;
    }
    .login-forgot:hover { text-decoration: underline; }
    .login-submit {
      width: 100%;
      min-height: 49px;
      border: 0;
      border-radius: 30px;
      color: #fff;
      background: linear-gradient(90deg, var(--primary, #0057FF), var(--secondary, #00D9FF));
      font-size: 14px;
      font-weight: 800;
      cursor: pointer;
      transition: transform .2s, box-shadow .2s;
    }
    .login-submit:hover {
      transform: translateY(-2px);
      box-shadow: 0 12px 30px rgba(0,217,255,.2);
    }
    .login-message {
      display: none;
      margin-top: 15px;
      padding: 12px;
      border: 1px solid rgba(255,193,7,.3);
      border-radius: 9px;
      color: #ffe6a1;
      background: rgba(255,193,7,.08);
      font-size: 12px;
      line-height: 1.6;
    }
    .login-message.visible { display: block; }
    .login-security {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      margin-top: 22px;
      color: #8e9bb7;
      font-size: 11px;
      text-align: center;
    }
    .login-security i { color: var(--secondary, #00D9FF); }
    .login-footer {
      padding: 20px;
      border-top: 1px solid rgba(255,255,255,.07);
      color: #8793ad;
      text-align: center;
      font-size: 12px;
    }
    .login-footer a {
      color: var(--secondary, #00D9FF);
      text-decoration: none;
    }
    @media (max-width: 800px) {
      .login-layout { grid-template-columns: 1fr; max-width: 470px; gap: 30px; }
      .login-intro { text-align: center; }
      .login-intro .eyebrow { margin: auto; }
      .login-intro h1 { font-size: clamp(34px, 8vw, 48px); }
      .login-intro > p { margin: auto; font-size: 14px; }
      .login-benefits { display: none; }
      .login-main { padding-top: 35px; }
    }
    @media (max-width: 420px) {
      .login-nav { min-height: 75px; padding: 10px 18px; }
      .login-brand img { height: 47px; max-width: 160px; }
      .login-back { font-size: 12px; }
      .login-card { padding: 23px 18px; }
      .login-role span { font-size: 11px; }
    }
  </style>
</head>
<body class="login-page">
  <header class="login-header">
    <nav class="login-nav" aria-label="Login navigation">
      <a class="login-brand" href="index.html" aria-label="360Electronix home">
        <img src="images/logo.png" alt="360Electronix">
      </a>
      <a class="login-back" href="index.html"><i class="fa-solid fa-arrow-left"></i> Back to website</a>
    </nav>
  </header>

  <main class="login-main">
    <div class="login-layout">
      <section class="login-intro">
        <div class="eyebrow"><i class="fa-solid fa-microchip"></i> Engineering workspace</div>
        <h1>Build. Track.<span>Deliver.</span></h1>
        <p>
          Your 360Electronix workspace for project coordination, engineering tasks,
          daily progress updates and client collaboration.
        </p>
        <div class="login-benefits">
          <div class="login-benefit"><i class="fa-solid fa-diagram-project"></i><span>Manage multiple projects and milestones</span></div>
          <div class="login-benefit"><i class="fa-solid fa-list-check"></i><span>Track assigned tasks and daily work</span></div>
          <div class="login-benefit"><i class="fa-solid fa-shield-halved"></i><span>Role-based workspace access</span></div>
        </div>
      </section>

      <section class="login-card" aria-labelledby="loginTitle">
        <h2 id="loginTitle">Welcome back</h2>
        <p class="card-subtitle">Sign in to continue to your workspace.</p>

        <form id="loginForm">
          <span class="login-label">Choose account type</span>
          <div class="login-roles">
            <label class="login-role">
              <input type="radio" name="role" value="admin" checked>
              <span><i class="fa-solid fa-user-shield"></i> Admin</span>
            </label>
            <label class="login-role">
              <input type="radio" name="role" value="team">
              <span><i class="fa-solid fa-users"></i> Team</span>
            </label>
            <label class="login-role">
              <input type="radio" name="role" value="client">
              <span><i class="fa-solid fa-briefcase"></i> Client</span>
            </label>
          </div>

          <div class="login-field">
            <label class="login-label" for="email">Email address</label>
            <input id="email" name="email" type="email" placeholder="you@company.com"
              autocomplete="username" required>
          </div>

          <div class="login-field">
            <label class="login-label" for="password">Password</label>
            <div class="login-password">
              <input id="password" name="password" type="password"
                placeholder="Enter your password" autocomplete="current-password" required>
              <button type="button" id="togglePassword" aria-label="Show password">Show</button>
            </div>
          </div>

          <div class="login-forgot-row">
            <a href="#" class="login-forgot" id="forgotPassword">Forgot password?</a>
          </div>

          <button class="login-submit" type="submit">Sign in <i class="fa-solid fa-arrow-right"></i></button>
          <div class="login-message" id="loginMessage" role="status" aria-live="polite"></div>
        </form>

        <div class="login-security"><i class="fa-solid fa-lock"></i> Authorized users only · Secure sign-in to be configured</div>
      </section>
    </div>
  </main>

  <footer class="login-footer">
    © 2026 360Electronix · <a href="index.html">Back to main website</a>
  </footer>

  <script>
    const passwordInput = document.getElementById('password');
    const toggleButton = document.getElementById('togglePassword');
    const message = document.getElementById('loginMessage');

    toggleButton.addEventListener('click', () => {
      const show = passwordInput.type === 'password';
      passwordInput.type = show ? 'text' : 'password';
      toggleButton.textContent = show ? 'Hide' : 'Show';
      toggleButton.setAttribute('aria-label', show ? 'Hide password' : 'Show password');
    });

    function showMessage(text) {
      message.textContent = text;
      message.classList.add('visible');
    }

    document.getElementById('loginForm').addEventListener('submit', (event) => {
      event.preventDefault();
      showMessage('Authentication is not connected yet. We will enable secure login after configuring the backend.');
    });

    document.getElementById('forgotPassword').addEventListener('click', (event) => {
      event.preventDefault();
      showMessage('Password recovery will be available after secure authentication is configured.');
    });
  </script>
</body>
</html>
