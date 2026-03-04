@php
    // Fetch menus
    $top_menu = \CoreModules\Admin\Service\MenuManager::get('top_menu');
    $all_main_menu = \CoreModules\Admin\Service\MenuManager::get('main_menu');
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

    // Determine active top-menu module
    $activeTopRoute = null;
    if (isset($topMenuByCtrl[$currentController])) {
        $activeTopRoute = $topMenuByCtrl[$currentController];
    } else {
        // Trace through parent chain (supports 2+ levels)
        foreach ($all_main_menu as $item) {
            $parts = explode('.', $item['route'] ?? '');
            $itemCtrl = $parts[1] ?? '';
            if ($itemCtrl === $currentController && !empty($item['parent'])) {
                $parentFqcn = $item['parent'];
                $parentParts = explode('\\', $parentFqcn);
                $parentShort = str_replace('Controller', '', end($parentParts));
                // Direct match to top_menu?
                if (isset($topMenuByCtrl[$parentShort])) {
                    $activeTopRoute = $topMenuByCtrl[$parentShort];
                    break;
                }
                // Parent is a main_menu item → trace one more level
                foreach ($all_main_menu as $parentItem) {
                    $pParts = explode('.', $parentItem['route'] ?? '');
                    $pCtrl = $pParts[1] ?? '';
                    if ($pCtrl === $parentShort && !empty($parentItem['parent'])) {
                        $grandParentParts = explode('\\', $parentItem['parent']);
                        $grandParentShort = str_replace('Controller', '', end($grandParentParts));
                        if (isset($topMenuByCtrl[$grandParentShort])) {
                            $activeTopRoute = $topMenuByCtrl[$grandParentShort];
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

    // Build 2-level sidebar hierarchy
    // Level 1: items whose parent maps to the active top_menu controller
    // Level 2: items whose parent maps to a Level 1 controller
    $level1_items = [];
    $level2_items = []; // grouped by parent controller name

    if ($activeTopCtrl) {
        foreach ($all_main_menu as $item) {
            $parentFqcn = $item['parent'] ?? null;
            if (!$parentFqcn) {
                // No parent → under "Configuración"
                if ($activeTopCtrl === 'Organization') {
                    $level1_items[] = $item;
                }
                continue;
            }
            $parentParts = explode('\\', $parentFqcn);
            $parentShort = str_replace('Controller', '', end($parentParts));

            if ($parentShort === $activeTopCtrl) {
                // Level 1: direct child of top_menu
                $level1_items[] = $item;
            } else {
                // Potential Level 2: check if parent is a Level 1 item
                $level2_items[$parentShort][] = $item;
            }
        }
    }

    $hasSidebar = !empty($level1_items);
@endphp

<div class="alixar-wrapper">
    {{-- TOP BAR --}}
    <nav class="alixar-top-bar d-flex align-items-center justify-content-between">
        <div class="d-flex align-items-center">
            <a href="index.php" class="alixar-brand d-flex align-items-center text-decoration-none">
                <i class="{{ \Alxarafe\Base\Config::getConfig()->main->appIcon ?? 'fas fa-rocket' }}"></i>
                <span>{{ \Alxarafe\Base\Config::getConfig()->main->appName ?? 'ALIXAR' }}</span>
            </a>
        </div>

        <div class="d-flex align-items-center flex-grow-1 overflow-x-auto justify-content-center">
            @if(!empty($top_menu) && is_array($top_menu))
                @foreach($top_menu as $item)
                    @php $isActive = ($item['route'] === $activeTopRoute); @endphp
                    <a href="{{ $item['url'] }}" class="top-menu-item {{ $isActive ? 'active' : '' }}" title="{{ $item['label'] }}">
                        <i class="{{ $item['icon'] ?? 'fas fa-circle' }}"></i>
                        <span>{{ $item['label'] }}</span>
                    </a>
                @endforeach
            @endif
        </div>

        <div class="d-flex align-items-center gap-2">
            <div class="nav-item dropdown">
                @include('partial.theme_switcher')
            </div>
            <div class="nav-item dropdown">
                @include('partial.lang_switcher')
            </div>
            @if(\Alxarafe\Lib\Auth::$user)
                <div class="dropdown">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown">
                        @if(!empty(\Alxarafe\Lib\Auth::$user->avatar) && file_exists(\Alxarafe\Base\Config::getPublicRoot() . '/' . \Alxarafe\Lib\Auth::$user->avatar))
                            <img src="{{ \Alxarafe\Lib\Auth::$user->avatar }}" class="rounded-circle border me-2" style="width: 28px; height: 28px; object-fit: cover;">
                        @else
                            <i class="fas fa-user-circle fa-lg"></i>
                        @endif
                        <span class="d-none d-md-inline ms-2 small">{{ \Alxarafe\Lib\Auth::$user->name ?? \Alxarafe\Lib\Auth::$user->username ?? 'User' }}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow">
                        @if(isset($user_menu) && is_array($user_menu))
                            @foreach($user_menu as $uItem)
                                <li><a class="dropdown-item" href="{{ $uItem['url'] }}">
                                    @if(!empty($uItem['icon'])) <i class="{{ $uItem['icon'] }} me-2 text-muted"></i> @endif
                                    {{ $uItem['label'] }}
                                </a></li>
                            @endforeach
                            <li><hr class="dropdown-divider"></li>
                        @endif
                        <li><a class="dropdown-item text-danger" href="index.php?module=Admin&controller=Auth&action=logout">
                            <i class="fas fa-sign-out-alt me-2"></i> {{ $me->_('logout') }}
                        </a></li>
                    </ul>
                </div>
            @else
                @if(stripos($_SERVER['QUERY_STRING'] ?? '', 'controller=Auth') === false)
                    <a class="btn btn-sm btn-outline-light" href="index.php?module=Admin&controller=Auth">
                        <i class="fas fa-sign-in-alt me-1"></i> {{ $me->_('login') }}
                    </a>
                @endif
            @endif
        </div>
    </nav>

    {{-- CONTENT + SIDEBAR --}}
    <div id="id_container" class="id_container {{ $hasSidebar ? 'has-sidebar' : 'no-sidebar' }}">
        @if($hasSidebar)
            <aside class="alixar-sidebar" id="sidebar-wrapper">
                <nav class="sidebar-nav">
                    @foreach($level1_items as $sItem)
                        @php
                            $parts = explode('.', $sItem['route'] ?? '');
                            $sController = $parts[1] ?? '';
                            $sActive = ($sController === $currentController);
                            $children = $level2_items[$sController] ?? [];
                            $hasChildren = !empty($children);
                            // Expand group if current controller is in children
                            $isExpanded = $sActive;
                            if (!$isExpanded) {
                                foreach ($children as $child) {
                                    $cParts = explode('.', $child['route'] ?? '');
                                    if (($cParts[1] ?? '') === $currentController) {
                                        $isExpanded = true;
                                        break;
                                    }
                                }
                            }
                        @endphp

                        @if($hasChildren)
                            {{-- Level 1: Collapsible group --}}
                            <div class="sidebar-group {{ $isExpanded ? 'expanded' : '' }}">
                                <a href="{{ $sItem['url'] }}" class="sidebar-link sidebar-group-toggle {{ $sActive ? 'active' : '' }}">
                                    <i class="{{ $sItem['icon'] ?? 'fas fa-chevron-right' }}"></i>
                                    <span>{{ $sItem['label'] }}</span>
                                    <i class="fas fa-angle-down sidebar-arrow ms-auto"></i>
                                </a>
                                <div class="sidebar-submenu {{ $isExpanded ? 'show' : '' }}">
                                    @foreach($children as $child)
                                        @php
                                            $cParts = explode('.', $child['route'] ?? '');
                                            $cController = $cParts[1] ?? '';
                                            $cAction = $cParts[2] ?? '';
                                            $cActive = ($cController === $currentController);
                                        @endphp
                                        <a href="{{ $child['url'] }}" class="sidebar-link sidebar-sublink {{ $cActive ? 'active' : '' }}">
                                            <i class="{{ $child['icon'] ?? 'fas fa-angle-right' }}"></i>
                                            <span>{{ $child['label'] }}</span>
                                        </a>
                                    @endforeach
                                </div>
                            </div>
                        @else
                            {{-- Level 1: Simple link --}}
                            <a href="{{ $sItem['url'] }}" class="sidebar-link {{ $sActive ? 'active' : '' }}">
                                <i class="{{ $sItem['icon'] ?? 'fas fa-chevron-right' }}"></i>
                                <span>{{ $sItem['label'] }}</span>
                            </a>
                        @endif
                    @endforeach
                </nav>
            </aside>
        @endif

        <main id="id-right" class="alixar-content">
            <div class="container-fluid py-3">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    @if ($me->title)
                        <h1 class="alixar-page-title m-0">{!! $me->title !!}</h1>
                    @endif
                    <div id="global-actions-container">
                        @yield('header_actions')
                    </div>
                </div>

                @include('partial.alerts')
                @yield('content')
            </div>
        </main>
    </div>
</div>
