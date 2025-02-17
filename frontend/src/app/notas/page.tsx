import { CChartLine } from "@coreui/react-chartjs";
import {
  CCard,
  CCardBody,
  CCardSubtitle,
  CCardTitle,
  CCol,
  CRow,
} from "@coreui/react-pro";
import SalesCard from "../components/cards/salesCard/SalesCard";

export default function Page() {
  return (
    <CRow>
      <CCol xl={4}>
        <CRow>
          <CCol xl={12}>
            <SalesCard/>
          </CCol>
        </CRow>
      </CCol>
    </CRow>
  );
}
