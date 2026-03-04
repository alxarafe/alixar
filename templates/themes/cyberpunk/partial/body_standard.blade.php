@php
    // Dynamic sidebar logic — 2-level hierarchy
    $top_menu = \CoreModules\Admin\Service\MenuManager::get('top_menu');
    $all_main_menu = \CoreModules\Admin\Service\MenuManager::get('main_menu');
    $user_menu_items = \CoreModules\Admin\Service\MenuManager::get('user_menu');
    $currentController = $me::getControllerName();

    // Build map of top-menu controller names → routes
    $topMenuByCtrl = [];
    foreach ($top_menu as $item) {
        $route = $item['route'] ?? '';
        $parts = explode('.', $route);
        $ctrlName = $parts[1] ?? '';
        if ($ctrlName) {
            $topMenuByCtrl[$ctrlName] = $route;
        }
    }

    // Determine active top-menu module (support 2-level parent chain)
    $activeTopRoute = null;
    if (isset($topMenuByCtrl[$currentController])) {
        $activeTopRoute = $topMenuByCtrl[$currentController];
    } else {
        foreach ($all_main_menu as $item) {
            $parts = explode('.', $item['route'] ?? '');
            $itemCtrl = $parts[1] ?? '';
            if ($itemCtrl === $currentController && !empty($item['parent'])) {
                $parentParts = explode('\\', $item['parent']);
                $parentShort = str_replace('Controller', '', end($parentParts));
                if (isset($topMenuByCtrl[$parentShort])) {
                    $activeTopRoute = $topMenuByCtrl[$parentShort];
                    break;
                }
                foreach ($all_main_menu as $parentItem) {
                    $pParts = explode('.', $parentItem['route'] ?? '');
                    $pCtrl = $pParts[1] ?? '';
                    if ($pCtrl === $parentShort && !empty($parentItem['parent'])) {
                        $gpParts = explode('\\', $parentItem['parent']);
                        $gpShort = str_replace('Controller', '', end($gpParts));
                        if (isset($topMenuByCtrl[$gpShort])) {
                            $activeTopRoute = $topMenuByCtrl[$gpShort];
                            break 2;
                        }
                    }
                }
            }
        }
    }

    $activeTopCtrl = null;
    if ($activeTopRoute) {
        $parts = explode('.', $activeTopRoute);
        $activeTopCtrl = $parts[1] ?? null;
    }

    // Build 2-level hierarchy
    $level1_items = [];
    $level2_items = [];
    if ($activeTopCtrl) {
        foreach ($all_main_menu as $item) {
            $parentFqcn = $item['parent'] ?? null;
            if (!$parentFqcn) {
                if ($activeTopCtrl === 'Organization') $level1_items[] = $item;
                continue;
            }
            $parentParts = explode('\\', $parentFqcn);
            $parentShort = str_replace('Controller', '', end($parentParts));
            if ($parentShort === $activeTopCtrl) {
                $level1_items[] = $item;
            } else {
                $level2_items[$parentShort][] = $item;
            }
        }
    }

    $hasSidebar = !empty($level1_items);
@endphp

<div class="cyber-shell">
    {{-- GRID OVERLAY --}}
    <div class="cyber-grid-overlay"></div>

    {{-- CYBERPUNK TOP BAR --}}
    <nav class="cyber-topbar d-flex align-items-center justify-content-between">
        <div class="d-flex align-items-center">
            <a href="index.php" class="cyber-brand d-flex align-items-center text-decoration-none">
                <span class="glitch" data-text="ALIXAR">ALIXAR</span>
            </a>
        </div>

        <div class="d-flex align-items-center gap-2 flex-grow-1 justify-content-center overflow-x-auto cyber-retro-container">
            @foreach($top_menu as $item)
                @php $isActive = ($item['route'] === $activeTopRoute); @endphp
                <a href="{{ $item['url'] }}" class="cyber-retro-button {{ $isActive ? 'active' : '' }}" title="{{ $item['label'] }}">
                    <span class="cyber-pixel pixel-tl"></span>
                    <span class="cyber-pixel pixel-tr"></span>
                    <span class="cyber-pixel pixel-bl"></span>
                    <span class="cyber-pixel pixel-br"></span>
                    <div class="cyber-button-inner">
                        <i class="{{ $item['icon'] ?? 'fas fa-circle' }} cyber-retro-icon {{ $isActive ? 'text-warning' : 'text-info' }}" style="font-size: 1.2rem;"></i>
                    </div>
                </a>
            @endforeach
        </div>

        <div class="d-flex align-items-center">
            <small class="text-secondary me-2 d-none d-lg-inline" style="font-family: 'Courier New', monospace;">> SYS.ONLINE_</small>
        </div>
    </nav>

    {{-- MAIN LAYOUT: LEFT SIDEBAR + CONTENT + RIGHT BAR --}}
    <div class="cyber-layout {{ $hasSidebar ? 'has-sidebar' : '' }}">

        {{-- LEFT SIDEBAR: 2-level dynamic menu --}}
        @if($hasSidebar)
            <aside class="cyber-sidebar-left">
                <div class="cyber-scanline"></div>
                <div class="cyber-section">
                    <h6 class="cyber-header px-3 mt-3 text-secondary">
                        <i class="fas fa-terminal me-2"></i>NAVIGATION
                    </h6>
                    <div class="d-flex flex-column">
                        @foreach($level1_items as $sItem)
                            @php
                                $parts = explode('.', $sItem['route'] ?? '');
                                $sController = $parts[1] ?? '';
                                $sActive = ($sController === $currentController);
                                $children = $level2_items[$sController] ?? [];
                                $hasChildren = !empty($children);
                                $isExpanded = $sActive;
                                if (!$isExpanded) {
                                    foreach ($children as $child) {
                                        $cParts = explode('.', $child['route'] ?? '');
                                        if (($cParts[1] ?? '') === $currentController) { $isExpanded = true; break; }
                                    }
                                }
                            @endphp

                            <a href="{{ $sItem['url'] }}" class="cyber-link d-block px-3 py-2 {{ $sActive ? 'cyber-link-active' : '' }}">
                                <span class="cyber-marker">{{ $sActive ? '[*]' : '[ ]' }}</span>
                                @if(!empty($sItem['icon']))<i class="{{ $sItem['icon'] }} me-2"></i>@endif
                                {{ strtoupper($sItem['label']) }}
                                @if($hasChildren)<i class="fas fa-angle-down ms-auto" style="font-size:0.6rem;"></i>@endif
                            </a>

                            @if($hasChildren)
                                <div class="cyber-submenu {{ $isExpanded ? '' : 'd-none' }}" style="padding-left: 20px; border-left: 1px solid #45a29e; margin-left: 16px;">
                                    @foreach($children as $child)
                                        @php
                                            $cParts = explode('.', $child['route'] ?? '');
                                            $cActive = (($cParts[1] ?? '') === $currentController);
                                        @endphp
                                        <a href="{{ $child['url'] }}" class="cyber-link d-block px-2 py-1 {{ $cActive ? 'cyber-link-active' : '' }}" style="font-size:0.78rem;">
                                            <span class="cyber-marker">{{ $cActive ? '►' : '·' }}</span>
                                            @if(!empty($child['icon']))<i class="{{ $child['icon'] }} me-1" style="font-size:0.75rem;"></i>@endif
                                            {{ strtoupper($child['label']) }}
                                        </a>
                                    @endforeach
                                </div>
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="cyber-footer mt-5 px-3">
                    <small class="text-muted d-block code-font">IP: 127.0.0.1</small>
                    <small class="text-muted d-block code-font">UPTIME: 99.9%</small>
                </div>
            </aside>
        @endif

        {{-- MAIN CONTENT --}}
        <main class="cyber-content">
            <div class="cyber-main-content p-4">
                <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-4 gap-2">
                    <h1 class="cyber-page-title mb-0 d-flex align-items-center">
                        @if($hasSidebar)
                            <button class="btn btn-sm btn-outline-info me-3 d-md-none" onclick="document.querySelector('.cyber-sidebar-left').classList.toggle('d-none');">
                                <i class="fas fa-bars"></i>
                            </button>
                        @endif
                        > {{ strtoupper($me->title ?? 'ALIXAR') }}_
                    </h1>
                    <div class="cyber-actions">
                        @yield('header_actions')
                    </div>
                </div>

                <div class="cyber-content-wrapper">
                    @include('partial.alerts')
                    @yield('content')
                </div>
            </div>
        </main>

        {{-- RIGHT BAR: User menu, theme, lang --}}
        <aside class="cyber-rightbar d-none d-md-flex flex-column align-items-center py-3 gap-3">
            {{-- Theme Switcher --}}
            <div class="cyber-right-item" title="Theme">
                <div class="dropstart">
                    <a href="#" class="cyber-retro-button" style="width:44px;height:44px;" data-bs-toggle="dropdown">
                        <div class="cyber-button-inner">
                            <i class="fas fa-palette text-info" style="font-size: 1rem;"></i>
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark cyber-dropdown">
                        @php
                            $themes = ['alixar','cyberpunk','vintage','default','alternative','high-contrast'];
                        @endphp
                        @foreach($themes as $t)
                            <li><a class="dropdown-item" href="index.php?module=Admin&controller=Auth&action=setTheme&theme={{ $t }}">
                                <i class="fas fa-circle me-2" style="color: {{ $t === 'cyberpunk' ? '#66fcf1' : ($t === 'vintage' ? '#d4a373' : ($t === 'alixar' ? '#4facfe' : '#aaa')) }};"></i>
                                {{ ucfirst($t) }}
                            </a></li>
                        @endforeach
                    </ul>
                </div>
            </div>

            {{-- Language --}}
            <div class="cyber-right-item" title="Language">
                <div class="dropstart">
                    <a href="#" class="cyber-retro-button" style="width:44px;height:44px;" data-bs-toggle="dropdown">
                        <div class="cyber-button-inner">
                            <i class="fas fa-globe text-info" style="font-size: 1rem;"></i>
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark cyber-dropdown">
                        <li><a class="dropdown-item" href="index.php?module=Admin&controller=Auth&action=setLang&lang=es_ES">🇪🇸 Español</a></li>
                        <li><a class="dropdown-item" href="index.php?module=Admin&controller=Auth&action=setLang&lang=en_US">🇺🇸 English</a></li>
                    </ul>
                </div>
            </div>

            {{-- Separator --}}
            <div style="width: 30px; border-top: 2px solid #45a29e;"></div>

            {{-- User Menu Items --}}
            @if(\Alxarafe\Lib\Auth::$user)
                @if(isset($user_menu_items) && is_array($user_menu_items))
                    @foreach($user_menu_items as $uItem)
                        <a href="{{ $uItem['url'] }}" class="cyber-retro-button" style="width:44px;height:44px;" title="{{ $uItem['label'] }}">
                            <div class="cyber-button-inner">
                                <i class="{{ $uItem['icon'] ?? 'fas fa-cog' }} text-info" style="font-size: 1rem;"></i>
                            </div>
                        </a>
                    @endforeach
                @endif

                {{-- User Avatar --}}
                <div class="mt-auto" title="{{ \Alxarafe\Lib\Auth::$user->name ?? 'User' }}">
                    <div class="dropstart">
                        <a href="#" class="cyber-retro-button" style="width:44px;height:44px;" data-bs-toggle="dropdown">
                            <div class="cyber-button-inner">
                                @if(!empty(\Alxarafe\Lib\Auth::$user->avatar) && file_exists(\Alxarafe\Base\Config::getPublicRoot() . '/' . \Alxarafe\Lib\Auth::$user->avatar))
                                    <img src="{{ \Alxarafe\Lib\Auth::$user->avatar }}" style="width:28px;height:28px;border-radius:50%;border:2px solid #66fcf1;">
                                @else
                                    <i class="fas fa-user text-warning" style="font-size: 1rem;"></i>
                                @endif
                            </div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark cyber-dropdown">
                            <li class="dropdown-header text-info" style="font-family:'Courier New',monospace;">
                                > {{ strtoupper(\Alxarafe\Lib\Auth::$user->username ?? 'USER') }}_
                            </li>
                            <li><hr class="dropdown-divider" style="border-color:#45a29e;"></li>
                            <li><a class="dropdown-item text-danger" href="index.php?module=Admin&controller=Auth&action=logout">
                                <i class="fas fa-power-off me-2"></i> LOGOUT
                            </a></li>
                        </ul>
                    </div>
                </div>
            @else
                <a class="cyber-retro-button mt-auto" style="width:44px;height:44px;" href="index.php?module=Admin&controller=Auth" title="Login">
                    <div class="cyber-button-inner">
                        <i class="fas fa-sign-in-alt text-success" style="font-size: 1rem;"></i>
                    </div>
                </a>
            @endif
        </aside>
    </div>
</div>

<style>
    /* Cyberpunk Layout */
    .cyber-topbar {
        background: rgba(11, 12, 16, 0.95);
        border-bottom: 2px solid #45a29e;
        padding: 0.5rem 1rem;
        position: sticky;
        top: 0;
        z-index: 1000;
        box-shadow: 0 2px 20px rgba(102, 252, 241, 0.1);
    }
    .cyber-brand span {
        font-size: 1.2rem;
        letter-spacing: 3px;
    }

    .cyber-layout {
        display: flex;
        min-height: calc(100vh - 56px);
    }

    .cyber-sidebar-left {
        width: 220px;
        min-width: 220px;
        background: rgba(31, 40, 51, 0.95);
        border-right: 2px solid #45a29e;
        position: relative;
        overflow: hidden;
    }

    .cyber-content {
        flex: 1;
        min-width: 0;
    }

    .cyber-rightbar {
        width: 70px;
        min-width: 70px;
        background: rgba(11, 12, 16, 0.95);
        border-left: 2px solid #45a29e;
        box-shadow: -2px 0 20px rgba(102, 252, 241, 0.05);
    }

    .cyber-dropdown {
        background: #0b0c10 !important;
        border: 1px solid #66fcf1 !important;
        font-family: 'Courier New', monospace;
    }
    .cyber-dropdown .dropdown-item {
        color: #c5c6c7;
        font-size: 0.85rem;
    }
    .cyber-dropdown .dropdown-item:hover {
        background: rgba(102, 252, 241, 0.15);
        color: #66fcf1;
    }

    .cyber-link-active {
        border-left: 3px solid #66fcf1 !important;
        background: rgba(102, 252, 241, 0.1) !important;
        color: #66fcf1 !important;
    }

    .cyber-main-content {
        margin-right: 0;
    }

    @media (max-width: 767px) {
        .cyber-sidebar-left {
            position: fixed;
            left: 0;
            top: 56px;
            bottom: 0;
            z-index: 999;
        }
    }
</style>
