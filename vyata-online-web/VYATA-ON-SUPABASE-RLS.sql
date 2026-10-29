-- VYATA ON: hardening RLS for online app
-- Run in Supabase SQL Editor for project vyata-on-online.
-- This keeps the existing tables and records; it only replaces policies.

-- Ensure profile is readable only by the signed-in account.
alter table public.profiles enable row level security;
drop policy if exists "profile_read_own" on public.profiles;
create policy "profile_read_own" on public.profiles
for select to authenticated using (id = (select auth.uid()));

-- Only profiles whose role is admin may access shared app data.
-- No policy here permits users to edit their own profile/role.
alter table public.app_settings enable row level security;
drop policy if exists "settings_authenticated_access" on public.app_settings;
drop policy if exists "app_settings_admin_all" on public.app_settings;
create policy "app_settings_admin_all" on public.app_settings
for all to authenticated
using (exists (select 1 from public.profiles p where p.id = (select auth.uid()) and p.role = 'admin'))
with check (exists (select 1 from public.profiles p where p.id = (select auth.uid()) and p.role = 'admin'));

alter table public.students enable row level security;
drop policy if exists "students_authenticated_access" on public.students;
drop policy if exists "students_admin_all" on public.students;
create policy "students_admin_all" on public.students
for all to authenticated
using (exists (select 1 from public.profiles p where p.id = (select auth.uid()) and p.role = 'admin'))
with check (exists (select 1 from public.profiles p where p.id = (select auth.uid()) and p.role = 'admin'));

alter table public.reports enable row level security;
drop policy if exists "reports_authenticated_access" on public.reports;
drop policy if exists "reports_admin_all" on public.reports;
create policy "reports_admin_all" on public.reports
for all to authenticated
using (exists (select 1 from public.profiles p where p.id = (select auth.uid()) and p.role = 'admin'))
with check (exists (select 1 from public.profiles p where p.id = (select auth.uid()) and p.role = 'admin'));

alter table public.running_text enable row level security;
drop policy if exists "running_text_authenticated_access" on public.running_text;
drop policy if exists "running_text_admin_all" on public.running_text;
create policy "running_text_admin_all" on public.running_text
for all to authenticated
using (exists (select 1 from public.profiles p where p.id = (select auth.uid()) and p.role = 'admin'))
with check (exists (select 1 from public.profiles p where p.id = (select auth.uid()) and p.role = 'admin'));
