"use client"

import { CChartLine } from "@coreui/react-chartjs";
import { CCard, CCardBody, CCardSubtitle, CCardTitle, CCol, CRow } from "@coreui/react-pro";

export default function SalesCard(){
    return (
        <CCard className="overflow-hidden mb-4">
                      <CCardBody className="p-4">
                        <CRow>
                          <CCol>
                            <CCardTitle className="fs-4 fw-semibold">Vendas</CCardTitle>
                          </CCol>
                          <CCol className="text-end text-primary fs-4 fw-semibold">
                            R$613.200
                          </CCol>
                        </CRow>
                        <CCardSubtitle className="fw-normal text-body-secondary">
                          Janeiro - Julho 2024
                        </CCardSubtitle>
                      </CCardBody>
                      <CChartLine
                        className="mt-3"
                        style={{ height: "150px" }}
                        data={{
                          labels: [
                            "Janeiro",
                            "Fevereiro",
                            "Março",
                            "Abril",
                            "Maio",
                            "Junho",
                            "Julho",
                          ],
                          datasets: [
                            {
                              label: "Vendas",
                             
                              borderWidth: 3,
                              data: [78452, 81745, 80746, 45134, 342145, 221728, 40137],
                              fill: true,
                            },
                          ],
                        }}
                        options={{
                          plugins: {
                            legend: {
                              display: false,
                            },
                            tooltip: {
                              callbacks: {
                                label: (context) => {
                                  const valor = context.parsed.y || 0;
                                  return `R$${valor.toLocaleString("pt-BR")}`;
                                },
                              },
                            },
                          },
        
                          maintainAspectRatio: false,
                          scales: {
                            x: {
                              display: false,
                            },
                            y: {
                              beginAtZero: true,
                              display: false,
                            },
                          },
                          elements: {
                            line: {
                              borderWidth: 2,
                              tension: 0.4,
                            },
                            point: {
                              radius: 0,
                              hitRadius: 10,
                              hoverRadius: 4,
                            },
                          },
                        }}
                      />
                    </CCard>
    )
}