import { BrowserRouter, Navigate, Route, Routes } from 'react-router-dom';
import { AuthProvider, useAuth } from '@/hooks/useAuth';
import { LoginPage } from '@/pages/Login';
import { POSPage } from '@/pages/POS';
import { InvoicesPage } from '@/pages/Invoices';
import { ItemsPage } from '@/pages/Items';
import { ReportsPage } from '@/pages/Reports';
import { Layout } from '@/components/Layout';

function Protected({ children }: { children: React.ReactElement }) {
  const { user, loading } = useAuth();
  if (loading) return <div style={{ padding: 32 }}>{ar.common.loading}</div>;
  if (!user)   return <Navigate to="/login" replace />;
  return children;
}

export default function App() {
  return (
    <AuthProvider>
      <BrowserRouter>
        <Routes>
          <Route path="/login" element={<LoginPage />} />
          <Route
            path="*"
            element={
              <Protected>
                <Layout>
                  <Routes>
                    <Route path="/"         element={<POSPage />} />
                    <Route path="/invoices" element={<InvoicesPage />} />
                    <Route path="/items"    element={<ItemsPage />} />
                    <Route path="/reports"  element={<ReportsPage />} />
                  </Routes>
                </Layout>
              </Protected>
            }
          />
        </Routes>
      </BrowserRouter>
    </AuthProvider>
  );
}

